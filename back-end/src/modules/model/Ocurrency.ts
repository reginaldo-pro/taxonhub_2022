import { EDataset } from './enumerators/types';

class Ocurrency {
    // model

    entry_name: string;
    found_name: string;
    accepted_name: string;
    base_de_dados: string;
    familia: string;
    pais: string;
    year: number;
    month: number;
    day: number;
    lat: number;
    long: number;
    Coord_SPL_Mun: string;

    constructor(
        entry_name: string,
        found_name: string,
        accepted_name: string,
        base_de_dados: string,
        familia: string,
        pais: string,
        year: number,
        month: number,
        day: number,
        lat: number,
        long: number,
        Coord_SPL_Mun: string,
    ) {
        this.entry_name = entry_name;
        this.found_name = found_name;
        this.accepted_name = accepted_name;
        this.base_de_dados = base_de_dados;
        this.familia = familia;
        this.pais = pais;
        this.year = year;
        this.month = month;
        this.day = day;
        this.lat = lat;
        this.long = long;
        this.Coord_SPL_Mun = Coord_SPL_Mun;
    }
}

export { Ocurrency };
