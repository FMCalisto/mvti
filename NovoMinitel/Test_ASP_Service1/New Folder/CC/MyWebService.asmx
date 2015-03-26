 <%@  WebService Language =" C#"  class =" MyClass" <% @ WebService Language = "C #" class = "MyClass"   %> %>

using  System.Web.Services ; usando System.Web.Services;

public class MyClass public class MyClass
{ (
        [WebMethod()] [WebMethod ()]
        public  int Add ( int a,  int  b) Adicionar público int (int a, int b)
        { (
                return a + b ; retorno a + b;        
        } )
} ) 