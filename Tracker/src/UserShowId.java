import javax.persistence.CascadeType;
import javax.persistence.Embeddable;
import javax.persistence.ManyToOne;

/**
 * Created by RicardoFerreira on 30/06/2017.
 */
@Embeddable
public class UserShowId {
    private User user;
    private Show show;

    @ManyToOne(cascade = CascadeType.ALL)
    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    @ManyToOne(cascade = CascadeType.ALL)
    public Show getShow() {
        return show;
    }

    public void setShow(Show show) {
        this.show = show;
    }
}
