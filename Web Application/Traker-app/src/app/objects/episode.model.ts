import { genre } from './genre.model'

export class episode{
    id:number;
    title: string;
    episode_number: number;

    certification: string;
    runtime: number;
    language: string;
    air_date: string;

    genres: genre[];
    
    rating: number;
    comments: number;

    country: string;
    aired: string;

    overview: string

}