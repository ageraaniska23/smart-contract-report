// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract LaporanSampah {
    struct Laporan {
        uint256 id;
        string topikLaporan;
        string jenisSampah;
        string lokasi;
        string sumberLimbah;
        string alasanDilaporkan;
    }

    mapping(uint256 => Laporan) private laporanMapping;
    uint256 private latestLaporanID;

    event LaporanDitambahkan(uint256 indexed id, string topikLaporan, string jenisSampah, string lokasi, string sumberLimbah, string alasanDilaporkan);

    function addLaporan(
        string memory topikLaporan,
        string memory jenisSampah,
        string memory lokasi,
        string memory sumberLimbah,
        string memory alasanDilaporkan
    ) public {
        latestLaporanID++;
        Laporan memory newLaporan = Laporan(
            latestLaporanID,
            topikLaporan,
            jenisSampah,
            lokasi,
            sumberLimbah,
            alasanDilaporkan
        );
        laporanMapping[latestLaporanID] = newLaporan;
        
        emit LaporanDitambahkan(latestLaporanID, topikLaporan, jenisSampah, lokasi, sumberLimbah, alasanDilaporkan);
    }

     function getDaftarIDLaporan() public view returns (uint256[] memory) {
        uint256[] memory daftarID = new uint256[](latestLaporanID);
        for (uint256 i = 1; i <= latestLaporanID; i++) {
            daftarID[i - 1] = i;
        }
        return daftarID;
    }

    function getLaporanByID(uint256 id) public view returns (Laporan memory) {
        require(id > 0 && id <= latestLaporanID, "Invalid ID");
        return laporanMapping[id];
    }
}
