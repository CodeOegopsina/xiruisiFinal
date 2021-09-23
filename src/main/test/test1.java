
import com.xiruisi.service.PayService;
import com.xiruisi.service.impl.PayServiceImpl;
import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;

public class test1 {
    public static void main(String[] args) {

        PayService payService = new PayServiceImpl();
        payService.addAddress("231097591801188352",1);
    }
}
