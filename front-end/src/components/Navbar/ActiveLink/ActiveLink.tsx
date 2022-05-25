import Link, { LinkProps } from "next/link";
import { useRouter } from "next/router";
import { cloneElement, ReactElement, useEffect, useMemo, useState } from "react";
import React from "react";
import { Flex } from "@chakra-ui/react";

interface ActiveLinkProps extends LinkProps {
  children: ReactElement;
  shouldMatchExactHref?: boolean;
}


export function ActiveLink({
  children,
  shouldMatchExactHref = false,
  ...rest
}: ActiveLinkProps) {
  const [path, setPath] = useState('');
  const router = useRouter();
  useEffect(() => {
    setPath(window.location.pathname);
  }, []);


  const isActive = useMemo(() => {
    return shouldMatchExactHref
      ? path == (rest.href || path == rest.as)
      : path.startsWith(String(rest.href)) ||
      path.startsWith(String(rest.as));
  }, [path, shouldMatchExactHref, rest]);

  console.log(isActive);
  return (
    <Link {...rest} >
      <a  onClick={() => router.push(rest.href)}>

      <Flex
        borderRadius="full"
        _hover={!isActive ? { bg: "gray.100" } : {}}
        bg={isActive ? "green.light" : "transparent"}
      >
        {cloneElement(children, {
          color: isActive ? "white" : "gray.primary",
        })}
      </Flex>
      </a>
    </Link>
  );
}

