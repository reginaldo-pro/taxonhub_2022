import { Box, Flex } from "@chakra-ui/react";
import { ReactNode } from "react";

interface StepperProps {
    isLastStep: boolean;
    height: string;
    children: ReactNode;
}

export function Stepper({isLastStep,height, children }: StepperProps) {
  return (
    <Flex flexDir={"row"}>
    <Flex align="center" justify={"flex-start"} flexDir={"column"}>
        <Flex
            w="5px"
            h="5px"
            bg="green.primary"
            borderRadius="8px"
            boxShadow="0px 0px 10px rgba(0, 0, 0, 0.1)"
            p="8px"
            flexDir="column"
            justifyContent="center"
            mr="10"
            mb="3"
        >
        </Flex>
        {!isLastStep && (
            <Flex
                w="3px"
                h={height}
                bg="green.primary"
                borderRadius="8px"
                p="3px"
                flexDir="column"
                justifyContent="flex-start"
                mr="10"
                mb="3"  
            >
            </Flex>
        )}
    </Flex>
    {children}
    </Flex>
  );
}
