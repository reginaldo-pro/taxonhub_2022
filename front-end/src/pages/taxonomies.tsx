import { Box, Container, Flex } from '@chakra-ui/react'
import { useState } from 'react'
import { FiDownload } from 'react-icons/fi'
import { CustomButton } from '../components/CustomButton'
import { SendCSV } from '../components/SendCSV'
import { Stepper } from '../components/Stepper'
import { TableComponent } from '../components/TableComponent'
import { api } from '../services/api'
import { v4 as uuidv4 } from 'uuid'
import { parseCookies, setCookie} from 'nookies'


export enum EDataset {
  WFO = 'WFO',
  GBIF = 'GBIF',
}
interface TaxonomiesProps {
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


//generate random data with TaxonomiesListProps interface
const taxonomies: TaxonomiesListProps = {
  taxonomies: [
    {
      searchedName: 'Acer',
      returnedName: 'Acer',
      acceptedNameOrSynonym: 'Acer',
      synonymOf: '',
      dataset: EDataset.WFO,
      respectiveFamily: '',
    },
    {
      searchedName: 'OrchisOrchis  OrchisOrchis OrchisOrchis ',
      returnedName: 'Orchis',
      acceptedNameOrSynonym: 'Orchis',
      synonymOf: 'fgfg',
      dataset: EDataset.GBIF,
      respectiveFamily: 'sdsd',
    },
    {
      searchedName: 'Bromus',
      returnedName: 'Bromus',
      acceptedNameOrSynonym: 'Bromus',
      synonymOf: 'dfdf',
      dataset: EDataset.WFO,
      respectiveFamily: 'dsfsdf',
    },
    {
      searchedName: 'Bromus',
      returnedName: 'Bromus',
      acceptedNameOrSynonym: 'Bromus',
      synonymOf: 'gfdgfd',
      dataset: EDataset.WFO,
      respectiveFamily: 'dfggfd',
    },
    {
      searchedName: 'Bromus',
      returnedName: 'Bromus',
      acceptedNameOrSynonym: 'Bromus',
      synonymOf: 'hghg',
      dataset: EDataset.WFO,
      respectiveFamily: '',
    },
    {
      searchedName: 'Bromus',
      returnedName: 'Bromus',
      acceptedNameOrSynonym: 'Bromus',
      synonymOf: 'ass',
      dataset: EDataset.WFO,
      respectiveFamily: 'ff',
    },
 
    
  ],
};

interface TaxonomiesPageProps {
  token: string;
}

const Home = ({token}: TaxonomiesPageProps) => {
  const [loading, setLoading] = useState(false);
  console.log(token)

  const getTaxonomy = async () => {
    setLoading(true);
    const {data} = await api.get('/taxonomy/generatecsv', {
        params: { 
          userId: token
        },
        responseType: 'blob'
      }
    );
    
    const url = window.URL.createObjectURL(new Blob([data]));
    const link = document.createElement('a');
    link.href = url;
    link.setAttribute('download', 'taxonomy.csv');
    link.click();
    
    setLoading(false);
  }


  const Timeline = [
    {
      title: 'Step 1',
      component: <SendCSV />,
      height: '150px',
    },
    {
      title: 'Step 2',
      component: <CustomButton onClick={getTaxonomy}>Realizar Busca</CustomButton>,
      height: '150px',
    },
    {
      title: 'Step 3',
      component: <TableComponent taxonomies={taxonomies.taxonomies} />,
      height: '590px',
    },
    {
      title: 'Step 4',
      component: <CustomButton icon={FiDownload}>Download</CustomButton>,
      height: '150px',
    }
  ]

  return (
    <Container
      maxW="8xl"
    >
    <Flex id="head" w={"100%"} p={{ sm: "1", md: "5" }} paddingBottom={'2px'} flexDir={{ base: 'column', md: 'column', lg: "column", xl: "column" }}>
      <Flex flexDir={"column"} w={'100%'} alignItems={"flex-start"} mt="100px" mb={"100px"}>
        {
          Timeline.map((step, index) => {
            return (
              <Stepper
                key={index}
                isLastStep={index === Timeline.length - 1}
                height={step.height}
              >
                <Box>
                {step.component}
                </Box>
              </Stepper>
            )
          })
        }
      </Flex>
    </Flex>
    </Container>
  )
}



export const getServerSideProps = async (ctx: any) => {
  const { "usr.token": token } = parseCookies(ctx);

  if (!token) {

    let uuid = uuidv4();
    setCookie(ctx, 'usr.token', uuid, {
      maxAge: 60 * 60 * 24 * 7,
    });
    return {
       props: {
          token: uuid,
       },
    };
  }
  return {
    props: {
      token,
    },
  };
};


export default Home
