# Definir las rutas y los sistemas con sus BIOS
declare -A bios_info=(
    ["AMIGA 1200 (AGA)"]="bios/amiga/bios kick39106.A1200 kick40068.A1200 kick40068.A4000"
    ["AMIGA 600 (ECS/OCS)"]="bios/amiga/bios kick33180.A500 kick34005.A500 kick37175.A500 kick40063.A600"
    ["AMIGA CD32"]="bios/amiga/bios kick40060.CD32 kick40060.CD32.ext"
    ["AMIGA CDTV"]="bios/amiga/bios kick34005.CDTV"
    ["APPLE IIGS"]="bios/apple2gs apple2gs1.rom apple2gs3.rom"
    ["APPLE MACINTOSH"]="bios/macintosh macintosh/MacII.ROM macintosh/MinivMacBootv2.dsk"
    ["ATARI 5200"]="bios/atari5200 5200.rom"
    ["ATARI 7800"]="bios/atari7800 7800 BIOS (U).rom 7800 BIOS (E).rom"
    ["ATARI 8BITS"]="bios/atari800 ATARIBAS.ROM ATARIOSA.ROM ATARIOSB.ROM ATARIXL.ROM"
    ["ATARI LYNX"]="bios/lynx lynxboot.img"
    ["ATARI ST/STTE/MEGASTE/TT/FALCON"]="bios/atarist tos.img atarist/st.img atarist/ste.img atarist/megaste.img atarist/tt.img atarist/falcon.img"
    ["COLECOVISION"]="bios/coleco coleco/boot.rom"
    ["COMMODORE 64"]="bios/vice vice/JiffyDOS_C64.bin vice/JiffyDOS_C128.bin vice/JiffyDOS_1541-II.bin vice/JiffyDOS_1571_repl310654.bin vice/JiffyDOS_1581.bin vice/SCPU64/scpu-dos-1.4.bin vice/SCPU64/scpu-dos-2.04.bin"
    ["DRAGON 32/64"]="bios/dragon dragon/d32.rom dragon/d64rom1.rom dragon/d64rom2.rom dragon/d64tano.rom dragon/d64tano2.rom dragon/d200rom1.rom dragon/d200rom2.rom dragon/ddos10.rom"
)

# Recorre el array de sistemas y sus rutas y BIOS
for system in "${!bios_info[@]}"; do
    # Extraer la ruta de destino y los archivos BIOS
    IFS=" " read -r bios_dir bios_files <<< "${bios_info[$system]}"
    
    # Mostrar el nombre del sistema
    echo "$system"
    echo
    
    # Descargar los archivos BIOS en la carpeta correspondiente
    for bios in $bios_files; do
        wget -c "${RUTA}$bios_dir/$bios" -P ../$bios_dir/
    done
    
    echo
done
