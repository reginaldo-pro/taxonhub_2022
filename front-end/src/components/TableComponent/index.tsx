import {
    Box,
    Flex,
    Td,
    Table,
    Tbody,
    Thead,
    Th,
    Tr,
    useBreakpointValue,
  } from "@chakra-ui/react";
  import { Pagination } from "../Pagination/index";
  import { useEffect, useState } from "react";
  import { SearchBox } from "../SearchBox";
import { TaxonomiesListProps, TaxonomiesProps } from "../../hooks/useTaxonomies";
  
  export function TableComponent( {taxonomies, ...rest} : TaxonomiesListProps) {
    const [page, setPage] = useState(1);
    const [items, setItems] = useState<TaxonomiesProps[]>([]);

    useEffect(() => {
      let newItems = taxonomies.slice((page - 1) * 3, page * 3);
      setItems(newItems);
    }, [page]);
  
    const isWideVersion = useBreakpointValue({
      base: false,
      lg: true,
    });

    return (
      <Box {...rest}  >
        <Flex w="100%" maxW={1480} mx="auto" px="6" mb="10">
          <Box flex="1" borderRadius={8} bg="green.light" p="6">
            <Flex mb="8" justify="space-between" align="center">
              <SearchBox />
            </Flex>
            <>
              <Table colorScheme="blackAlpha">
                <Thead>
                  <Tr>
                    <Th px={["4", "4", "6"]} color="gray.900" w="8">
                      Base
                    </Th>
                    <Th color="gray.primary">Nome buscado</Th>
                    <Th color="gray.primary">Nome retornado</Th>
                    {isWideVersion && <Th color="gray.primary">Nome aceito/sinônimo</Th>}
                    {isWideVersion && <Th color="gray.primary">Sinonimo de</Th>}
                    {isWideVersion && <Th color="gray.primary">Familia respectiva</Th>}
                    <Th w="8"></Th>
                  </Tr>
                </Thead>
                <Tbody>
                  {items.map((item, index) => (
                    <Tr key={index}>
                      <Td px={["4", "4", "6"]} fontWeight={"bold"} fontSize={"10px"}>
                        {item.dataset}
                      </Td>
                        <Td color={"gray.dark"} maxW={170}>
                          {item.searchedName}
                        </Td>
                        <Td color={"gray.dark"} maxW={170}>
                          {item.returnedName}
                        </Td>
                        {isWideVersion && <Td color={"gray.dark"} maxW={170}>
                          {item.acceptedNameOrSynonym}
                        </Td>}
                        {isWideVersion && <Td color={"gray.dark"} maxW={170}>
                          {item.synonymOf}
                        </Td>}
                        {isWideVersion && <Td color={"gray.dark"} maxW={170}>
                          {item.respectiveFamily}
                        </Td>}
                    </Tr>
                  ))}
                </Tbody>
              </Table>
              <Pagination
                totalCountOfRegisters={6}
                currentPage={page}
                registersPerPage={3}
                onPageChange={setPage}
              />
            </>
          </Box>
        </Flex>
      </Box>
    );
  }
  