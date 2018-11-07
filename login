import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.testng.Assert;
import org.testng.annotations.AfterTest;
import org.testng.annotations.BeforeTest;
import org.testng.annotations.Test;
import java.util.concurrent.TimeUnit;

public class LoginTests {
    WebDriver driver;


    @BeforeTest
    public void beforeTest() {
        System.setProperty("webdriver.chrome.driver", "C:\\Selenium\\chromedriver.exe");
        driver = new ChromeDriver();
        driver.manage().timeouts().implicitlyWait(15, TimeUnit.SECONDS);
        driver.manage().deleteAllCookies();
        driver.get("http://automationpractice.com/index.php");
        driver.manage().window().maximize();
    }

    @AfterTest
    public void afterTest() {
        driver.manage().deleteAllCookies();
        driver.quit();
    }

    @Test(priority = 0)
    public void goodLogin() throws InterruptedException {

        driver.findElement(By.xpath("//a[@title='Log in to your customer account']")).click();
        driver.findElement(By.id("email")).sendKeys("kasikaaakaakupiecka.1994@gmail.com");
        driver.findElement(By.id("passwd")).sendKeys("Jakieshaslo2019");
        driver.findElement(By.xpath("//button[@id='SubmitLogin']//span")).click();
        Thread.sleep(4000);

        WebElement logout = (driver.findElement(By.xpath("//a[@title='Log me out']")));
        boolean bool = logout.isDisplayed();
        Assert.assertEquals(true, bool);

    }

    @Test(priority = 1)
    public void badPass() throws InterruptedException {
        Thread.sleep(4000);
        driver.findElement(By.xpath("//a[@title='Log me out']")).click();
        driver.findElement(By.id("email")).sendKeys("kasikaaakaakupiecka.1994@gmail.com");
        driver.findElement(By.id("passwd")).sendKeys("akieshaslo2019");
        driver.findElement(By.xpath("//button[@id='SubmitLogin']//span")).click();

        WebElement badPass = (driver.findElement(By.xpath("//p[contains(text(),'There is 1 error')]")));
        boolean bool = badPass.isDisplayed();
        Assert.assertEquals(true, bool);

    }

    @Test(priority = 2)
    public void badlogin() throws InterruptedException {
        Thread.sleep(4000);
        driver.findElement(By.id("email")).clear();
        driver.findElement(By.id("passwd")).clear();
        driver.findElement(By.id("email")).sendKeys("asikaaakaakupiecka.1994@gmail.com");
        driver.findElement(By.id("passwd")).sendKeys("Jakieshaslo2019");
        driver.findElement(By.xpath("//button[@id='SubmitLogin']//span")).click();

        WebElement badPass = (driver.findElement(By.xpath("//p[contains(text(),'There is 1 error')]")));
        boolean bool = badPass.isDisplayed();
        Assert.assertEquals(true, bool);

    }
}
