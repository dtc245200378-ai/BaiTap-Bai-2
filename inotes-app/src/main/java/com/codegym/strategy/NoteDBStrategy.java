package com.codegym.strategy;

import com.codegym.model.Note;
import com.codegym.model.NoteType;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class NoteDBStrategy implements NoteStrategy {
    private String jdbcURL = "jdbc:mysql://localhost:3306/inotes_db?useSSL=false&allowPublicKeyRetrieval=true";
    private String jdbcUsername = "root";
    private String jdbcPassword = "password";

    protected Connection getConnection() throws SQLException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
    }

    @Override
    public void save(Note note) {
        if (note.getId() > 0) {
            String sql = "UPDATE notes SET title = ?, content = ?, type_id = ? WHERE id = ?";
            try (Connection conn = getConnection();
                 PreparedStatement pstmt = conn.prepareStatement(sql)) {
                pstmt.setString(1, note.getTitle());
                pstmt.setString(2, note.getContent());
                pstmt.setInt(3, note.getTypeId());
                pstmt.setInt(4, note.getId());
                pstmt.executeUpdate();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        } else {
            String sql = "INSERT INTO notes (title, content, type_id) VALUES (?, ?, ?)";
            try (Connection conn = getConnection();
                 PreparedStatement pstmt = conn.prepareStatement(sql)) {
                pstmt.setString(1, note.getTitle());
                pstmt.setString(2, note.getContent());
                pstmt.setInt(3, note.getTypeId());
                pstmt.executeUpdate();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    @Override
    public boolean delete(int id) {
        String sql = "DELETE FROM notes WHERE id = ?";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, id);
            return pstmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public List<Note> findAll() {
        List<Note> notes = new ArrayList<>();
        String sql = "SELECT n.id, n.title, n.content, n.type_id, t.name as type_name " +
                     "FROM notes n LEFT JOIN note_type t ON n.type_id = t.id ORDER BY n.id DESC";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {
            while (rs.next()) {
                Note note = new Note(rs.getInt("id"), rs.getString("title"), rs.getString("content"), rs.getInt("type_id"));
                note.setTypeName(rs.getString("type_name"));
                notes.add(note);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return notes;
    }

    @Override
    public List<Note> search(String keyword) {
        List<Note> notes = new ArrayList<>();
        String sql = "SELECT n.id, n.title, n.content, n.type_id, t.name as type_name " +
                     "FROM notes n LEFT JOIN note_type t ON n.type_id = t.id " +
                     "WHERE n.title LIKE ? OR n.content LIKE ? ORDER BY n.id DESC";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            String searchTerm = "%" + keyword + "%";
            pstmt.setString(1, searchTerm);
            pstmt.setString(2, searchTerm);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                Note note = new Note(rs.getInt("id"), rs.getString("title"), rs.getString("content"), rs.getInt("type_id"));
                note.setTypeName(rs.getString("type_name"));
                notes.add(note);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return notes;
    }

    @Override
    public Note findById(int id) {
        String sql = "SELECT n.id, n.title, n.content, n.type_id, t.name as type_name " +
                     "FROM notes n LEFT JOIN note_type t ON n.type_id = t.id WHERE n.id = ?";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, id);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                Note note = new Note(rs.getInt("id"), rs.getString("title"), rs.getString("content"), rs.getInt("type_id"));
                note.setTypeName(rs.getString("type_name"));
                return note;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public List<NoteType> findAllTypes() {
        List<NoteType> types = new ArrayList<>();
        String sql = "SELECT * FROM note_type";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {
            while (rs.next()) {
                types.add(new NoteType(rs.getInt("id"), rs.getString("name"), rs.getString("description")));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return types;
    }
}
