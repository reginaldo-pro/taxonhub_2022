import {
    Box,
    Flex,
    Link,
    Button,
    Icon,
    Checkbox,
    Td,
    Text,
    Table,
    Tbody,
    Thead,
    Th,
    Tr,
    useBreakpointValue,
  } from "@chakra-ui/react";
  import { RiAddLine, RiFileCopy2Fill } from "react-icons/ri";
  import { Pagination } from "../Pagination/index";
  import NextLink from "next/link";
  import { useState } from "react";
  import { SearchBox } from "../SearchBox";
import { TaxonomiesListProps } from "../../pages/taxonomies";
  
  
  export function TableComponent( {taxonomies, ...rest} : TaxonomiesListProps) {
    const [page, setPage] = useState(1);
  
    const isWideVersion = useBreakpointValue({
      base: false,
      lg: true,
    });
  
    return (
      <Box {...rest}>
        <Flex w="100%" my="6" maxW={1480} mx="auto" px="6">
          <Box flex="1" borderRadius={8} bg="green.light" p="6">
            <Flex mb="8" justify="space-between" align="center">
              <SearchBox />
              {/* <NextLink href={"/users/create"} passHref>
                <Button
                  as="a"
                  size="md"
                  fontSize="sm"
                  bg="yellow.orange"
                  leftIcon={<Icon as={RiAddLine} fontSize="20" />}
                >
                  Gerar relatório
                </Button>
              </NextLink> */}
            </Flex>
            <>
              <Table colorScheme="blackAlpha">
                <Thead>
                  <Tr>
                    <Th px={["4", "4", "6"]} color="gray.900" w="8">
                      Base
                    </Th>
                    <Th color="gray.primary">Nome Buscado</Th>
                    {isWideVersion && <Th color="gray.primary">Nome encontrado</Th>}
                    <Th w="8"></Th>
                  </Tr>
                </Thead>
                <Tbody>
                  {taxonomies.map((item, index) => (
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
                    </Tr>
                  ))}
                </Tbody>
              </Table>
              <Pagination
                totalCountOfRegisters={100}
                currentPage={page}
                registersPerPage={10}
                onPageChange={setPage}
              />
            </>
          </Box>
        </Flex>
      </Box>
    );
  }
  