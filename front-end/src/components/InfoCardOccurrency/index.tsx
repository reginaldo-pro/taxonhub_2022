import { Box, Flex, Table, TableContainer, Tbody, Td, Text, Tfoot, Th, Thead, Tr } from "@chakra-ui/react";

export function InfoCardOccurrency() {
    return (
        <Box position={"absolute"} w="900px" mt="14" marginLeft={"20px"} h="50px" borderRadius="2px">
            Formato do header CSV:
            <Box w="100%" h="100%" bg="GrayText" borderRadius={"5px"} bottom="10%" left={{ base: "-10%", sm: "10%" }} >
                <TableContainer>
               
                </TableContainer>
                <Text  fontSize={"12px"} color={"white"} ml="5" mt="2" w="100%">
                </Text>
                <Text fontSize={"12px"} color={"white"} ml="5" mt="2">
                    Nome pesquisado,Nome retornado,Nome aceito/sinonimo,Sinônimo de,Base de dados(FDB/TPL(WFO)),Família respectiva da base de dados
                </Text>
            </Box>
        </Box>
    )
}