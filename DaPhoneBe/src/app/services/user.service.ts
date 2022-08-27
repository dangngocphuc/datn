import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { environment } from 'src/environments/environment';
import { HttpBaseService } from './http-base.service';

@Injectable({
  providedIn: 'root'
})
export class UserService {
  Url=environment.urlServer
  constructor(private http: HttpBaseService) {}
  getUsers(params): Observable<any> {
    return this.http.get<any>(`${this.Url}/user`, params);
  }
  deleteUser(id): Observable<any> {
    return this.http.delete<any>(`${this.Url}/user/delete/` + id);
  }
  saveUser(user): Observable<any> {
    return this.http.post<any>(`${this.Url}/user/save`, user);
  }
}
