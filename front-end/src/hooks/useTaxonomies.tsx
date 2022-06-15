import { parseCookies, setCookie } from "nookies";
import { createContext, ReactNode, useContext, useRef, useState } from "react";
import { api } from "../services/api";
import { v4 as uuidv4 } from "uuid";
import { useToast } from "@chakra-ui/react";
export interface IUseTaxonomies {
  file?: string | Blob;
  setFile: (file: File) => void;
  loading: boolean;
  getTaxonomies: (token: string) => Promise<void>;
  step: number;
  setStep: (step: number) => void;
 taxonomies: TaxonomiesListProps;
}


const TaxonomiesContext = createContext<IUseTaxonomies>(null as any);

interface IProviderProps {
  children: ReactNode;
}

export enum EDataset {
    WFO = 'WFO',
    GBIF = 'GBIF',
  }
  
  
export interface TaxonomiesProps {
    searchedName: string;
    returnedName: string;
    acceptedNameOrSynonym: string;
    synonymOf: string;
    dataset: EDataset;
    respectiveFamily: string;
  }

  export interface TaxonomiesListProps {
    taxonomies: TaxonomiesProps[];
  }

  

 
  
  

export function TaxonomiesProvider({ children }: IProviderProps) {
  const [file, setFile] = useState<string | Blob>('');
  const [step, setStep] = useState<number>(1);
  const [loading, setLoading] = useState(false);
  const [taxonomies, setTaxonomies] = useState<TaxonomiesListProps>({taxonomies: []});
  const toast = useToast();

  const getTaxonomies = async (token: string) => {
    setLoading(true);
    const formData = new FormData();
    formData.append("file", file);

    console.log(token)
    const { data } = await api.post("/import", formData, {
      params: {
        userId: token,
      },
      headers: {
        Authorization: `Bearer ${token}`,
        "Content-Type": "multipart/form-data",
      },
    });
    if (data.data.correct) {
      toast(
        {
          title: "Sucesso!",
          description: "Busca sendo realizada...",
          status: "success",
          duration: 9000,
          position: "top-right",
          isClosable: true,
        },
      )
      
      const {data } = await api.get("/taxonomy/generatecsv", {
        params: {
          userId: token,
        },
        headers: {
          Authorization: `Bearer ${token}`,
        },
      }).then(res => {
        setStep(4);
        return res;
      })

       console.log(data)
       setLoading(false);
      //store data csv in array
        const csv = data
        //8 position array of csv

        const csvArray = new Array(6).fill(0).map(
          (_, i) => csv.split("\n")[i + 1].split(",")
        );
       setTaxonomies({taxonomies: csvArray.map((row, index) => {
        return {
          searchedName: row[0],
          returnedName: row[1],
          acceptedNameOrSynonym: row[2],
          synonymOf: row[3],
          dataset: row[4] === "WFO" ? EDataset.WFO : EDataset.GBIF,
          respectiveFamily: row[5],

        }
      })})

        
        
       
    }
    else {
      setLoading(false);
      toast(
        {
          title: "Erro!",
          description: "O Formato do arquivo não é válido. Cheque o formato padrão e tente novamente.",
          status: "error",
          duration: 12000,
          position: "top-right",
          isClosable: true,
        },
      )
    }


  }

  return (
    <TaxonomiesContext.Provider
      value={{
        file,
        setFile,
        loading,
        getTaxonomies,
        step,
        setStep,
        taxonomies
      }
      }
    >
      {children}
    </TaxonomiesContext.Provider>
  ) as React.ReactElement;
}

export function useTaxonomies() {
  const context = useContext(TaxonomiesContext);

  return context;
}


