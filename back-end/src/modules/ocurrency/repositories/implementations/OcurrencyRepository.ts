import { Ocurrency } from '../../../model/Ocurrency';
import { IOcurrencyRepository } from '../IOcurrencyRepository';

class OcurrencyRepository implements IOcurrencyRepository {
    private ocurrencies: Ocurrency[];
    private static INSTANCE: OcurrencyRepository;

    private constructor() {
        this.ocurrencies = [];
    }

    public static getInstance(): OcurrencyRepository {
        if (!OcurrencyRepository.INSTANCE) {
            OcurrencyRepository.INSTANCE = new OcurrencyRepository();
        }

        return OcurrencyRepository.INSTANCE;
    }

    list(): Ocurrency[] {
        return this.ocurrencies;
    }

    findByName(name: string): Ocurrency[] {
        const ocurrencies = this.ocurrencies.filter(
            (ocurrency) => ocurrency.name === name,
        );

        return ocurrencies;
    }
}

export { OcurrencyRepository };
