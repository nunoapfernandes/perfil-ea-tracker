/**
 * Created by RicardoFerreira on 02/07/2017.
 */
import { Component } from '@angular/core';
import 'rxjs/add/operator/map';
import 'rxjs/Rx'
import {HttpService} from '../../http.service';

@Component({
  selector: 'app-mediagrid-show',
  templateUrl: './mediagrid-show.component.html',
  styleUrls: ['./mediagrid-show.component.css'],
  providers: [HttpService],
})

export class MediaGridShowComponent {
  response: Object = {};

  constructor(private httpService: HttpService) {
    this.httpService.getMovies().subscribe(data => console.log(this.response = data));
  }

  range = (value) => {
    let a = [];
    for ( let i = 0; i < value; ++i) {
      a.push(i);
    }
    return a;
  }

}


