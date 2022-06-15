import { Flex, Spinner } from "@chakra-ui/react";
import { useTaxonomies } from "../../hooks/useTaxonomies";
import { CustomButton } from "../CustomButton";


export function DoSearch({ token }: { token: string }) {
    const { loading, getTaxonomies} = useTaxonomies();
    return (
        <Flex align="center">
          <CustomButton onClick={() => getTaxonomies(token)} >{!loading ? 'Realizar busca' : 'Realizando busca...'}</CustomButton>
          {loading && <Spinner size="md" ml="5" />}
        </Flex>
    )
}

