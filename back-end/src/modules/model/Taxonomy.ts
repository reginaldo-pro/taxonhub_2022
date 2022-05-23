import { EDataset } from './enumerators/types';

class TaxonomyModel {
    searchedName: string;
    returnedName: string;
    acceptedNameOrSynonym: string;
    synonymOf: string;
    dataset: EDataset;
    respectiveFamily: string;

    constructor(
        searchedName: string,
        returnedName: string,
        acceptedNameOrSynonym: string,
        synonymOf: string,
        dataset: EDataset,
        respectiveFamily: string,
    ) {
        this.searchedName = searchedName;
        this.returnedName = returnedName;
        this.acceptedNameOrSynonym = acceptedNameOrSynonym;
        this.synonymOf = synonymOf;
        this.dataset = dataset;
        this.respectiveFamily = respectiveFamily;
    }
}

export { TaxonomyModel };
