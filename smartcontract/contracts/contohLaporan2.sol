// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;
import "@openzeppelin/contracts/access/Ownable.sol";

contract Report is Ownable {
    struct DataReport {
        string jenisSampah;
        bool isPabrik;
        string asal;
        uint256 tglLaporan;
        string lokasi;
        string alasanPelaporan;
        string jenisPermohonan;
    }

    uint256 public noLaporan;
    mapping(uint256 => DataReport) public dataReport;


    //event untuk menyimpan new data report
    event NewDataReport(
        uint256 indexed noLaporan,
        string jenisSampah,
        bool isPabrik,
        string asal,
        uint256 tglLaporan,
        string lokasi,
        string alasanPelaporan,
        string jenisPermohonan
    );

    constructor() Ownable(msg.sender) {}

    //function menambahkan data laporan
    function newDataReport(
        string memory _jenisSampah,
        bool _isPabrik,
        string memory _asal,
        uint256 _tglLaporan,
        string memory _lokasi,
        string memory _alasanPelaporan,
        string memory _jenisPermohonan
    ) external onlyOwner {
        noLaporan++;  //setiap laporan dibuat no laporan selalu bertambah +1
        //menyimpan data dalam bentuk no laporan
        dataReport[noLaporan] = DataReport(
            _jenisSampah,
            _isPabrik,
            _asal,
            _tglLaporan,
            _lokasi,
            _alasanPelaporan,
            _jenisPermohonan
        );

        //memanggil event
        emit NewDataReport(
            noLaporan,
            _jenisSampah,
            _isPabrik,
            _asal,
            _tglLaporan,
            _lokasi,
            _alasanPelaporan,
            _jenisPermohonan
        );
    }


    //function untuk mendapatkan data berdasaran dari no laporan
    function getDataReportByNoLaporan(uint256 _noLaporan) external view returns (
        string memory jenisSampah,
        bool isPabrik,
        string memory asal,
        uint256 tglLaporan,
        string memory lokasi,
        string memory alasanPelaporan,
        string memory jenisPermohonan
    ) {
        require(_noLaporan > 0 && _noLaporan <= noLaporan, "Invalid report number");
        DataReport memory report = dataReport[_noLaporan];
        return (
            report.jenisSampah,
            report.isPabrik,
            report.asal,
            report.tglLaporan,
            report.lokasi,
            report.alasanPelaporan,
            report.jenisPermohonan
        );
    }
}
