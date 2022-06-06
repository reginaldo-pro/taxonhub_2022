import { Box, Flex } from "@chakra-ui/react";
import { ReactNode } from "react";

interface StepperProps {
    children: ReactNode;
}

export function Stepper({ children }: StepperProps) {
  return (
    <Flex align="center" >
        <Flex
            w="100%"
            h="100%"
            bg="green.primary"
            borderRadius="8px"
            boxShadow="0px 0px 10px rgba(0, 0, 0, 0.1)"
            p="8px"
            flexDir="column"
            justifyContent="center"
            mr="10"
        >
        </Flex>
            {children}
    </Flex>
  );
}
