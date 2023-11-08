Config = {}


Config.blips = {
    -- Example {title="", colour=, id=, x=, y=, z=},
     {title="Miner", colour=46, id=318, x = 2934.64, y = 2741.96, z = 44.36 },
     {title="Miner", colour=46, id=318, x = 2156.84, y = 3827.48, z = 29.72 },
     {title="Miner", colour=46, id=318, x = 1111.04, y = -2009.0, z = 30.64 },
}

Config.Barang = {
    'batu',
    'batucuci',
}

Config.HadiahMelebur = {
    {barang = 'tembaga', Peluang = math.random(10,15)},
    {barang = 'baja', Peluang = math.random(5,10)},
    {barang = 'emas', Peluang = math.random(1,8)},
    {barang = 'permata', Peluang = math.random(0,1)},
}

Config.Anim = {
    {-- anim ambil batu
        nama = 'plyr_rear_takedown_b',
        dict = 'melee@hatchet@streamed_core',
    },
    {-- anim cuci batu
        nama = 'idle_a_female',
        dict = 'amb@world_human_gardener_plant@female@idle_a',
    },
    {-- anim lebur batu
        nama = 'fixing_a_player',
        dict = 'mini@repair',
    },
}

Config.Persyaratanbarang = {
    'beliung',
    'batu',
    'batucuci',
}

Config.Jumlah = {
    1,
    2,
    3,
}

Config.Peluang = {
    math.random(1 , 100),
    math.random(1 , 3),
}

Config.Areamenambang = {
    {
        Id = 'mulaimenambang1',
        nama = 'Start Mining',
        koordinat = vector3(2934.64, 2741.96, 44.36),
        event = 'cj-mining:client:menambangbatu',
        ikon = 'fa-solid fa-pickaxe',
    },
    {
        Id = 'mulaimenambang2',
        nama = 'Start Mining',
        koordinat = vector3(2935.0, 2753.28, 44.96),
        event = 'cj-mining:client:menambangbatu',
        ikon = 'fa-solid fa-pickaxe',
    },
    {
        Id = 'mulaimenambang3',
        nama = 'Start Mining',
        koordinat = vector3(2942.12, 2733.08, 46.76),
        event = 'cj-mining:client:menambangbatu',
        ikon = 'fa-solid fa-pickaxe',
    },
    {
        Id = 'mencucibatu',
        nama = 'Washing Stone',
        koordinat = vector3(2156.84, 3827.48, 29.72),
        event = 'cj-mining:client:cucibatu',
        ikon = 'fa-solid fa-water',
    },
    {
        Id = 'meleburbatu',
        nama = 'Smelting Stone',
        koordinat = vector3(1111.04, -2009.0, 30.64),
        event = 'cj-mining:client:leburbatu',
        ikon = 'fa-solid fa-fireplace',
    },
}