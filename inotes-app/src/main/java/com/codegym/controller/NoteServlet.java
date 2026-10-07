package com.codegym.controller;

import com.codegym.model.Note;
import com.codegym.model.NoteType;
import com.codegym.service.NoteManagement;
import com.codegym.strategy.NoteDBStrategy;
import com.codegym.strategy.NoteFileStrategy;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "NoteServlet", urlPatterns = {"/notes", ""})
public class NoteServlet extends HttpServlet {
    private NoteManagement noteManagement;

    public void init() {
        noteManagement = new NoteManagement();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) action = "";

        // Chuyển đổi tầng lưu trữ qua Session
        HttpSession session = request.getSession();
        String storageType = (String) session.getAttribute("storageType");
        if ("file".equalsIgnoreCase(storageType)) {
            noteManagement.setStrategy(new NoteFileStrategy());
        } else {
            noteManagement.setStrategy(new NoteDBStrategy());
            session.setAttribute("storageType", "db");
        }

        switch (action) {
            case "create":
                showCreateForm(request, response);
                break;
            case "edit":
                showEditForm(request, response);
                break;
            case "delete":
                deleteNote(request, response);
                break;
            case "view":
                viewNote(request, response);
                break;
            case "switchStorage":
                switchStorage(request, response);
                break;
            default:
                listNotes(request, response);
                break;
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        if (action == null) action = "";

        switch (action) {
            case "create":
                insertNote(request, response);
                break;
            case "edit":
                updateNote(request, response);
                break;
            default:
                listNotes(request, response);
                break;
        }
    }

    private void switchStorage(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String type = request.getParameter("type");
        HttpSession session = request.getSession();
        if ("file".equalsIgnoreCase(type)) {
            session.setAttribute("storageType", "file");
            noteManagement.setStrategy(new NoteFileStrategy());
        } else {
            session.setAttribute("storageType", "db");
            noteManagement.setStrategy(new NoteDBStrategy());
        }
        response.sendRedirect("notes");
    }

    private void listNotes(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String keyword = request.getParameter("search");
        List<Note> listNotes;
        if (keyword != null && !keyword.trim().isEmpty()) {
            listNotes = noteManagement.searchNotes(keyword);
            request.setAttribute("searchKeyword", keyword);
        } else {
            listNotes = noteManagement.findAll();
        }
        request.setAttribute("listNotes", listNotes);
        RequestDispatcher dispatcher = request.getRequestDispatcher("note/list.jsp");
        dispatcher.forward(request, response);
    }

    private void showCreateForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<NoteType> listTypes = noteManagement.findAllTypes();
        request.setAttribute("listTypes", listTypes);
        RequestDispatcher dispatcher = request.getRequestDispatcher("note/create.jsp");
        dispatcher.forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Note existingNote = noteManagement.getNoteById(id);
        List<NoteType> listTypes = noteManagement.findAllTypes();
        request.setAttribute("note", existingNote);
        request.setAttribute("listTypes", listTypes);
        RequestDispatcher dispatcher = request.getRequestDispatcher("note/create.jsp");
        dispatcher.forward(request, response);
    }

    private void viewNote(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Note note = noteManagement.getNoteById(id);
        request.setAttribute("note", note);
        RequestDispatcher dispatcher = request.getRequestDispatcher("note/view.jsp");
        dispatcher.forward(request, response);
    }

    private void insertNote(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        int typeId = Integer.parseInt(request.getParameter("typeId"));

        noteManagement.addNote(title, content, typeId);
        response.sendRedirect("notes");
    }

    private void updateNote(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        int typeId = Integer.parseInt(request.getParameter("typeId"));

        Note note = new Note(id, title, content, typeId);
        noteManagement.save(note);
        response.sendRedirect("notes");
    }

    private void deleteNote(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        noteManagement.deleteNote(id);
        response.sendRedirect("notes");
    }
}
