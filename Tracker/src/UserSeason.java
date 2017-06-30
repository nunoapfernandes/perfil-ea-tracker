import javax.persistence.*;

/**
 * Created by RicardoFerreira on 30/06/2017.
 */

@Entity
@Table(name = "user_has_season")
@AssociationOverrides({
        @AssociationOverride(name = "primaryKey.userSeason",
                joinColumns = @JoinColumn(name = "user_id")),
        @AssociationOverride(name = "primaryKey.season",
                joinColumns = @JoinColumn(name = "season_id")) })
public class UserSeason {
    public UserSeason(){}

    // composite-id key
    private UserSeasonId primaryKey = new UserSeasonId();

    @Column(name = "watched")
    private boolean watched;
    @Column(name = "watchlist")
    private boolean watchlist;
    @Column(name = "rating")
    private int rating;
    @Column(name = "comment")
    private String comment;
    @Column(name = "episodes_watched")
    private int episodes_watched;

    public UserSeasonId getPrimaryKey() {
        return primaryKey;
    }

    public void setPrimaryKey(UserSeasonId primaryKey) {
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

    public int getEpisodes_watched() {
        return episodes_watched;
    }

    public void setEpisodes_watched(int episodes_watched) {
        this.episodes_watched = episodes_watched;
    }
}
