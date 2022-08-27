import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { environment } from 'src/environments/environment';
import { HttpBaseService } from './http-base.service';

@Injectable({
  providedIn: 'root',
})
export class UserService {
  Url=environment.urlServer
  constructor(private http: HttpBaseService) {}
  login(userName, passWord): Observable<any> {
    const user = { username: userName, password: passWord };
    return this.http.post<any>(`${this.Url}/authenticate/user/login`, user);
  }
  saveUser(user): Observable<any> {
    return this.http.post<any>(`${this.Url}/user/save`, user);
  }
  getUser(id): Observable<any> {
    return this.http.get<any>(`${this.Url}/user/` + id, null);
  }
}
