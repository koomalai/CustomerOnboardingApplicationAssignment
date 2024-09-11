import { QueryClient, QueryClientProvider } from 'react-query'
import SnackbarProvider from './shared/components/Contexts/SnackbarProvider';
import AppRouters from './App/AppRoutes';

const queryClient = new QueryClient({
  defaultOptions: {
    queries: {
      refetchOnWindowFocus: false,
      retry: 0,
      suspense: true,
    },
  },
});

function App() {
  return (
    <QueryClientProvider client={queryClient}>
      <SnackbarProvider>
          <AppRouters />
      </SnackbarProvider>
    </QueryClientProvider>
  )
}
export default App
