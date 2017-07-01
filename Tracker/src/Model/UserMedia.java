package Model;

import javax.persistence.*;
import java.text.DecimalFormat;
import java.time.format.DateTimeFormatter;
import java.util.Date;

/**
 * Created by RicardoFerreira on 01/07/2017.
 */

@Entity
@Table(name = "user_has_media")
@AssociationOverrides({
        @AssociationOverride(name = "primaryKey.user",
                joinColumns = @JoinColumn(name = "user_id")),
        @AssociationOverride(name = "primaryKey.media",
                joinColumns = @JoinColumn(name = "media_id")) })
public class UserMedia {
    public UserMedia(){}

    // composite-id key
    @Id
    private UserMediaId primaryKey = new UserMediaId();

    @Column (name = "user_id")
    private int user_id;
    @Column (name = "media_id")
    private int media_id;
    @Column(name = "watched")
    private boolean watched;
    @Column(name = "watchlist")
    private boolean watchlist;
    @Column(name = "rating")
    private int rating;
    @Column(name = "comment")
    private String comment;
    @Column (name = "add_date")
    @Temporal(TemporalType.TIMESTAMP)
    private Date add_date;
    @Column (name = "view_date")
    @Temporal(TemporalType.TIMESTAMP)
    private Date view_date;

    public UserMediaId getPrimaryKey() {
        return primaryKey;
    }

    public void setPrimaryKey(UserMediaId primaryKey) {
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

    public Date getAdd_date() {
        return add_date;
    }

    public void setAdd_date(Date add_date) {
        this.add_date = add_date;
    }

    public Date getView_date() {
        return view_date;
    }

    public void setView_date(Date view_date) {
        this.view_date = view_date;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public int getMedia_id() {
        return media_id;
    }

    public void setMedia_id(int media_id) {
        this.media_id = media_id;
    }
}
