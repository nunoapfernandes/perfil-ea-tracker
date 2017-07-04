import { Genre } from './genre.model';



export class Season{
    id:number;
    title: string;
    season_number: number;

    certification: string;
    runtime: number;
    language: string;
    air_date: string;

    genres: Genre[];
    episodes: number;

    rating: number;
    comments: number;

    country: string;
    premier_date: string;

    overview: string;

}
