package model;

import javax.persistence.*;
import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name="season")
@PrimaryKeyJoinColumn(name="season_id", referencedColumnName = "id_media")
public class Season extends Media implements Serializable{

    @Column(name = "season_id", nullable = false, insertable = false, updatable = false)
    private int season_id;
    @Column(name = "number")
    private int number;
    @Column(name = "episodes")
    private int episodes;
    @Column(name = "aired_episodes")
    private int aired_episodes;
    @OneToMany(fetch = FetchType.LAZY)
    @JoinTable(name = "season_episode", joinColumns = {@JoinColumn (name = "season_id")},inverseJoinColumns = { @JoinColumn (name = "episode_Id")})
    private Set<Episode> episodesList = new HashSet<>();


    public int getSeason_id() {
        return season_id;
    }

    public void setSeason_id(int season_id) {
        this.season_id = season_id;
    }

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

    public Set<Episode> getEpisodesList() {
        return episodesList;
    }

    public void setEpisodesList(Set<Episode> episodesList) {
        this.episodesList = episodesList;
    }
}
