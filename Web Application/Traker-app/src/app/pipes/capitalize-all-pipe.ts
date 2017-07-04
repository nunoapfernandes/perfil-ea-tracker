/**
 * Created by RicardoFerreira on 04/07/2017.
 */
import { Pipe, PipeTransform } from '@angular/core';
/*
 * Capitalize the first letter of the string
 * Takes a string as a value.
 * Usage:
 *  value | capitalizefirst
 * Example:
 *  // value.name = daniel
 *  {{ value.name | capitalizefirst  }}
 *  fromats to: Daniel
 */
@Pipe({
  name: 'capitalizeAll'
})
export class CapitalizeAllPipe implements PipeTransform {
  transform(value: string, args: any[]): string {
    if (value === null) { return 'Not assigned'};
    return value.toUpperCase();
  }
}
