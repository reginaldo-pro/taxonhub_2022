import { Ocurrency } from "../../model/Ocurrency";




interface IOcurrencyRepository {
    findByName(name: string): Ocurrency[] ;
    list(): Ocurrency[];
    //incluir metodos (filtro e etc)
}

export { IOcurrencyRepository };