package junitmockito;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.mockito.Mockito.*;

import org.junit.jupiter.api.Test;

public class MyServiceTest {

    @Test
    public void testExternalApi() {

        // Created Mock Object
        ExternalApi mockApi = mock(ExternalApi.class);

        // Created Stub Method
        when(mockApi.getData()).thenReturn("Mock Data");

        // Injected Mock into Service
        MyService service = new MyService(mockApi);

        // Call Service Method
        String result = service.fetchData();

        // Verifying Result
        assertEquals("Mock Data", result);

        // Verification
        verify(mockApi).getData();
    }
}
