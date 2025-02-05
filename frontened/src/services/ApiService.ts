import http from "@/http-common";
import type { Todo } from "@/types/todo";
import type { AxiosRequestConfig, AxiosResponse, AxiosError } from "axios";

class ApiService {
  getAll(): Promise<AxiosResponse<Todo[]>> {
    return http.get("/api/v1/todos");
  }

  get(id: any): Promise<any> {
    return http.get(`/api/v1/todos/${id}`);
  }

  create(data: Todo): Promise<void> {
    return http.post("/api/v1/todos", data);
  }

  update(id: any, data: any): Promise<any> {
    return http.put(`/api/v1/todos/${id}`, data);
  }

  delete(id: number): Promise<void> {
    return http.delete(`/api/v1/todos/${id}`);
  }

  deleteAll(): Promise<any> {
    return http.delete(`/api/v1/todos`);
  }

  findByDescription(title: string): Promise<any> {
    return http.get(`/api/v1/todos?title=${title}`);
  }
}

export default new ApiService();
