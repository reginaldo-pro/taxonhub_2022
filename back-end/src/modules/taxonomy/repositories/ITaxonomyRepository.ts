import { Taxonomy } from "../../model/Taxonomy";



interface ITaxonomyRepository {
    findByName(name: string): Taxonomy[] ;
    list(): Taxonomy[];
    //incluir metodos (filtro e etc)
}

export { ITaxonomyRepository };