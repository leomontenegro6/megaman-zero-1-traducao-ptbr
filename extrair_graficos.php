<?php
$graficos = [
    (object)['nome' => 'Fonte dialogos', 'offset' => '0x0C9590', 'tiles' => '16x60', 'codec' => '4bpp'],
    (object)['nome' => 'Fonte pequena', 'offset' => '0x0D0D90', 'tiles' => '16x8', 'codec' => '4bpp'],
    (object)['nome' => 'Menu Status', 'offset' => '0x2F5A94', 'tiles' => '32x16', 'codec' => '4bpp'],
    (object)['nome' => 'Menu Opcoes', 'offset' => '0x2F9A94', 'tiles' => '32x16', 'codec' => '4bpp'],
    (object)['nome' => 'Tela Resultados', 'offset' => '0x2FFE34', 'tiles' => '32x16', 'codec' => '4bpp'],
    (object)['nome' => 'Sound Only', 'offset' => '0x7E9DAC', 'tiles' => '8x8', 'codec' => '4bpp'],
];

foreach($graficos as $g) {
    $caminho = "Graficos/Originais/{$g->nome}.gba";
    $offset_decimal = hexdec(str_replace('0x', '', $g->offset));
    $tiles = explode('x', $g->tiles);
    $codec = $g->codec ?? '4bpp';
    $tile_size = ($codec == '8bpp') ? (64) : (32);
    $tamanho = $tiles[0] * $tiles[1] * $tile_size;

    shell_exec("dd if=\"orig.gba\" of=\"$caminho\" skip=$offset_decimal count=$tamanho bs=1");
}