import { Box, Flex } from '@chakra-ui/react'
import type { NextPage } from 'next'
import { CustomButton } from '../components/CustomButton'
import { SendCSV } from '../components/SendCSV'
import { Stepper } from '../components/Stepper'
import { TableComponent } from '../components/TableComponent'

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
      searchedName: 'Orchis',
      returnedName: 'Orchis',
      acceptedNameOrSynonym: 'Orchis',
      synonymOf: '',
      dataset: EDataset.GBIF,
      respectiveFamily: '',
    },
    {
      searchedName: 'Bromus',
      returnedName: 'Bromus',
      acceptedNameOrSynonym: 'Bromus',
      synonymOf: '',
      dataset: EDataset.WFO,
      respectiveFamily: '',
    },
  ],
};

const Home: NextPage = () => {
  return (
    <Flex id="head" w={"100%"} p={{ sm: "1", md: "5" }} paddingBottom={'2px'} flexDir={{ base: 'column', md: 'column', lg: "column", xl: "row" }}>
      <Flex flexDir={"row"} w={'100%'} alignItems={"center"} mt="100px" mb={"100px"} ml={{ sm: '1%', md: "5%" }}>
        <Stepper>
        <Box>
        <SendCSV />
        </Box>
        </Stepper>
      </Flex>
      <Box>
        <CustomButton>
          Realizar Busca
        </CustomButton>
      </Box>
      <Box>
        <TableComponent
          taxonomies={taxonomies.taxonomies}
        />
      </Box>
    </Flex>
  )
}

export default Home
