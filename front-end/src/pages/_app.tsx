import '../styles/globals.css'
import type { AppProps } from 'next/app'
import { ChakraProvider, extendTheme } from '@chakra-ui/react'
import themeFile from '../theme/theme'
import { useEffect, useState } from 'react'
import { createRoot, Root } from 'react-dom/client';
import { Navbar } from '../components/Navbar'
const theme = extendTheme(themeFile)



function MyApp({ Component, pageProps }: AppProps) {
  const [root, setRoot] = useState<Root>() as [Root, (root: Root) => void]

  useEffect(() => {
    const root = createRoot(
      document.getElementById('__next') as HTMLDivElement
    )
    setRoot(root)
  }, [])

  if (!root) {
    return null
  }

  root.render(
    <ChakraProvider theme={theme}>
      <Navbar>
        <Component {...pageProps} />
      </Navbar>
    </ChakraProvider>
  )
}

export default MyApp
