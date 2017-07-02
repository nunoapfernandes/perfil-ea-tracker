import beans.UserBean;
import model.User;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

/**
 * Created by RicardoFerreira on 02/07/2017.
 */
@Path("/home")
public class HelloWorld {

    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public User hello(){


        UserBean userBean = new UserBean();
        User user = userBean.getUserById(1);
        return user;
    }
}
