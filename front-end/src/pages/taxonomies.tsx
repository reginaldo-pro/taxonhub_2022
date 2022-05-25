import { Flex } from '@chakra-ui/react'
import type { NextPage } from 'next'

const Home: NextPage = () => {
  return (
    <Flex id="head" w={"100%"} p={{ sm: "1", md: "5" }} paddingBottom={'2px'} flexDir={{ base: 'column', md: 'column', lg: "column", xl: "row" }}>
      <Flex flexDir={"row"} w={'100%'} alignItems={"center"} mt="100px" mb={"100px"} ml={{ sm: '1%', md: "5%" }}>
        salve
      </Flex>
    </Flex>
  )
}

export default Home
