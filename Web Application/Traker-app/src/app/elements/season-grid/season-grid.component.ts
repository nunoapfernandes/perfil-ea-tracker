

import { Component } from '@angular/core';
import 'rxjs/Rx'

@Component({
  selector: 'app-season-grid',
  templateUrl: './season-grid.component.html',
  styleUrls: ['./season-grid.component.css']
})

export class SeasonGridComponent {
  num = 8;
  range = (value) => {
    let a = [];
    for(let i = 0; i < value; ++i) {
      a.push(i)
    }
    return a;
  }
}
