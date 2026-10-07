package com.codegym.service;

import com.codegym.model.Product;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ProductServiceImpl implements ProductService {
    private static Map<Integer, Product> products = new HashMap<>();

    static {
        products.put(1, new Product(1, "iPhone 15 Pro", 28000000, "Smartphone cao cấp từ Apple", "Apple"));
        products.put(2, new Product(2, "Samsung Galaxy S24", 22000000, "Flagship AI mới nhất", "Samsung"));
        products.put(3, new Product(3, "MacBook Pro M3", 45000000, "Laptop đồ họa hiệu năng cao", "Apple"));
        products.put(4, new Product(4, "Dell XPS 15", 38000000, "Laptop doanh nhân siêu mỏng", "Dell"));
        products.put(5, new Product(5, "Sony WH-1000XM5", 8500000, "Tai nghe chống ồn đỉnh cao", "Sony"));
    }

    @Override
    public List<Product> findAll() {
        return new ArrayList<>(products.values());
    }

    @Override
    public void save(Product product) {
        products.put(product.getId(), product);
    }

    @Override
    public Product findById(int id) {
        return products.get(id);
    }

    @Override
    public void update(int id, Product product) {
        products.put(id, product);
    }

    @Override
    public void remove(int id) {
        products.remove(id);
    }

    @Override
    public List<Product> findByName(String name) {
        List<Product> result = new ArrayList<>();
        if (name == null || name.trim().isEmpty()) {
            return findAll();
        }
        for (Product p : products.values()) {
            if (p.getName().toLowerCase().contains(name.trim().toLowerCase())) {
                result.add(p);
            }
        }
        return result;
    }
}
