package model;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

@Entity
@Table(name = "user_has_media")
public class UserMedia implements Serializable{

    @Id
    @ManyToOne
    private User usertr;
    @Id
    @ManyToOne
    private Media media;
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

    public User getUsertr() {
        return usertr;
    }

    public void setUsertr(User usertr) {
        this.usertr = usertr;
    }

    public Media getMedia() {
        return media;
    }

    public void setMedia(Media media) {
        this.media = media;
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
}
