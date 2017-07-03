package model;

import javax.persistence.*;
import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name="season")
@PrimaryKeyJoinColumn(name="season_id", referencedColumnName = "id_media")
public class Season extends Media implements Serializable{

    @Column(name = "number")
    private int number;
    @Column(name = "episodes")
    private int episodes;
    @Column(name = "aired_episodes")
    private int aired_episodes;
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "show_id", nullable = false)
    private Show show;
    @OneToMany(fetch = FetchType.LAZY, mappedBy = "season")
    private Set<Episode> episodesList = new HashSet<>();

    public int getNumber() {
        return number;
    }

    public void setNumber(int number) {
        this.number = number;
    }

    public int getEpisodes() {
        return episodes;
    }

    public void setEpisodes(int episodes) {
        this.episodes = episodes;
    }

    public int getAired_episodes() {
        return aired_episodes;
    }

    public void setAired_episodes(int aired_episodes) {
        this.aired_episodes = aired_episodes;
    }

    public Show getShow() {
        return show;
    }

    public void setShow(Show show) {
        this.show = show;
    }

    public Set<Episode> getEpisodesList() {
        return episodesList;
    }

    public void setEpisodesList(Set<Episode> episodesList) {
        this.episodesList = episodesList;
    }
}
