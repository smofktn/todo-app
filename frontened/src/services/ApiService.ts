import http from "@/http-common";
import type { Todo } from "@/types/todo";

class ApiService {
  getAll(): Promise<any> {
    return http.get("/api/v1/todos");
  }

  get(id: any): Promise<any> {
    return http.get(`/api/v1/todos/${id}`);
  }

  create(data: Todo): Promise<any> {
    return http.post("/api/v1/todos", data);
  }

  update(id: any, data: any): Promise<any> {
    return http.put(`/api/v1/todos/${id}`, data);
  }

  delete(id: any): Promise<any> {
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
