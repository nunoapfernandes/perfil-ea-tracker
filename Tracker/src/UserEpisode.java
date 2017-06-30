import javax.persistence.*;

/**
 * Created by RicardoFerreira on 30/06/2017.
 */

@Entity
@Table(name = "user_has_episode")
@AssociationOverrides({
        @AssociationOverride(name = "primaryKey.userEpisode",
                joinColumns = @JoinColumn(name = "user_id")),
        @AssociationOverride(name = "primaryKey.episode",
                joinColumns = @JoinColumn(name = "episode_id")) })
public class UserEpisode {
    public UserEpisode(){}

    // composite-id key
    private UserMovieId primaryKey = new UserMovieId();

    @Column(name = "watched")
    private boolean watched;
    @Column(name = "watchlist")
    private boolean watchlist;
    @Column(name = "rating")
    private int rating;
    @Column(name = "comment")
    private String comment;

    public UserMovieId getPrimaryKey() {
        return primaryKey;
    }

    public void setPrimaryKey(UserMovieId primaryKey) {
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
}
