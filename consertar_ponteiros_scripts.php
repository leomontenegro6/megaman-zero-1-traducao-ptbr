<?php

$compiled_dir = __DIR__ . DIRECTORY_SEPARATOR . 'Scripts' . DIRECTORY_SEPARATOR . 'Compilados';
$scripts = glob($compiled_dir . DIRECTORY_SEPARATOR . '*.msg');

if ($scripts === false || count($scripts) === 0) {
    fwrite(STDERR, "Nenhum arquivo .msg encontrado em {$compiled_dir}.\n");
    exit(1);
}

$pending_writes = [];
$already_normalized = [];

foreach ($scripts as $script) {
    $contents = file_get_contents($script);
    if ($contents === false || strlen($contents) < 2) {
        fwrite(STDERR, "Não foi possível ler um arquivo .msg válido: {$script}.\n");
        exit(1);
    }

    $table_size = unpack('v', substr($contents, 0, 2))[1];
    if ($table_size === 0) {
        $already_normalized[] = basename($script);
        continue;
    }

    if (($table_size % 2) !== 0 || $table_size > strlen($contents)) {
        fwrite(STDERR, "Tabela de ponteiros inválida em {$script}.\n");
        exit(1);
    }

    $pointer_table = '';
    for ($offset = 0; $offset < $table_size; $offset += 2) {
        $pointer = unpack('v', substr($contents, $offset, 2))[1];
        if ($pointer < $table_size || $pointer > strlen($contents)) {
            fwrite(STDERR, "Ponteiro inválido em {$script}, offset 0x" . strtoupper(dechex($offset)) . ".\n");
            exit(1);
        }

        $pointer_table .= pack('v', $pointer - $table_size);
    }

    $pending_writes[$script] = [
        'contents' => $pointer_table . substr($contents, $table_size),
        'table_size' => $table_size,
    ];
}

foreach ($pending_writes as $script => $entry) {
    if (file_put_contents($script, $entry['contents']) === false) {
        fwrite(STDERR, "Não foi possível salvar {$script}.\n");
        exit(1);
    }

    printf("%s: ponteiros ajustados (base 0x%04X).\n", basename($script), $entry['table_size']);
}

foreach ($already_normalized as $script) {
    printf("%s: já normalizado.\n", $script);
}