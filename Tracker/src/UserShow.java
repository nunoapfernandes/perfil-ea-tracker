import javax.persistence.*;

/**
 * Created by RicardoFerreira on 30/06/2017.
 */
@Entity
@Table(name = "user_has_show")
@AssociationOverrides({
        @AssociationOverride(name = "primaryKey.userShow",
                joinColumns = @JoinColumn(name = "user_id")),
        @AssociationOverride(name = "primaryKey.show",
                joinColumns = @JoinColumn(name = "show_id")) })
public class UserShow {

    public UserShow(){}

    // composite-id key
    private UserShowId primaryKey = new UserShowId();

    @Column(name = "watched")
    private boolean watched;
    @Column(name = "watchlist")
    private boolean watchlist;
    @Column(name = "rating")
    private int rating;
    @Column(name = "comment")
    private String comment;
    @Column(name = "seasons_watched")
    private int seasons_watched;

    public UserShowId getPrimaryKey() {
        return primaryKey;
    }

    public void setPrimaryKey(UserShowId primaryKey) {
        this.primaryKey = primaryKey;
    }

    public boolean isWatched() {
        return watched;
    }

    public void setWatched(boolean watched) {
        this.watched = watched;
    }

    public boolean isWatchlist() {
        return watchlist;
    }

    public void setWatchlist(boolean watchlist) {
        this.watchlist = watchlist;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public int getSeasons_watched() {
        return seasons_watched;
    }

    public void setSeasons_watched(int seasons_watched) {
        this.seasons_watched = seasons_watched;
    }
}
