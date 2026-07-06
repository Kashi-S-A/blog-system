package com.blog.util;

import java.io.IOException;
import java.time.LocalDate;
import java.util.List;

import com.blog.entity.Blog;
import com.blog.entity.User;

import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Font;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;

import jakarta.servlet.http.HttpServletResponse;

public class PdfGenerator {
	
	public static void generateActiveUsersPdf(
	        HttpServletResponse response,
	        List<User> users)
	        throws DocumentException, IOException {
		
		response.setContentType("application/pdf");

		response.setHeader(
		        "Content-Disposition",
		        "attachment; filename=MostActiveUsers.pdf");
		
		Document document = new Document();

		PdfWriter.getInstance(
		        document,
		        response.getOutputStream());

		document.open();

//		document.add(
//		        new Paragraph("Most Active Users Report")
//		);
		
		//TITLE
		
		Font titleFont = new Font(Font.FontFamily.HELVETICA, 18, Font.BOLD);

		Paragraph title = new Paragraph("Most Active Users Report", titleFont);

		title.setSpacingAfter(20);

		document.add(title);

		
		
		//TABLE
		
		PdfPTable table = new PdfPTable(4);

		table.setWidthPercentage(100);
		
		//HEADER
		
		table.addCell(new PdfPCell(new Phrase("Username")));
		table.addCell(new PdfPCell(new Phrase("Full Name")));
		table.addCell(new PdfPCell(new Phrase("Email")));
		table.addCell(new PdfPCell(new Phrase("Blogs")));
		
		
		//DATA
		
		for(User user : users){

		    table.addCell(user.getUsername());

		    table.addCell(user.getFullName());

		    table.addCell(user.getEmail());

		    table.addCell(String.valueOf(user.getBlogs().size()));

		}
		
		
		document.add(table);
		
		document.close();
		
		
		
		

	}
	
	public static void generatePendingPostsPdf(
	        HttpServletResponse response,
	        List<Blog> blogs)
	        throws DocumentException, IOException {

	    response.setContentType("application/pdf");

	    response.setHeader(
	            "Content-Disposition",
	            "attachment; filename=PendingPosts.pdf");

	    Document document = new Document();

	    PdfWriter.getInstance(document, response.getOutputStream());

	    document.open();
	    
	    //title
	    Font titleFont = new Font(Font.FontFamily.HELVETICA, 18, Font.BOLD);
	    Paragraph title = new Paragraph("Pending Posts Report", titleFont);
	    
	    title.setSpacingAfter(10);
	    document.add(title);

	    //Generated Date
	    
	    Paragraph date = new Paragraph(
	            "Generated On : " + LocalDate.now());

	    date.setSpacingAfter(20);

	    document.add(date);
	    
	    
	    
	    //Table
	    
	    PdfPTable table = new PdfPTable(4);

	    table.setWidthPercentage(100);
	    //Col width
	    table.setWidths(new float[] {4, 2, 2, 3});
	    
	    //header
	    
	    table.addCell("Title");
	    table.addCell("Author");
	    table.addCell("Status");
	    table.addCell("Created Date");
	    
	    //Table data
	    
	    for (Blog blog : blogs) {

	        table.addCell(blog.getTitle());

	        table.addCell(blog.getUser().getUsername());

	        table.addCell(blog.getStatus().toString());

	        table.addCell(blog.getCreatedDate().toString());
	    }
	    
	    document.add(table);

	    
	    document.close();
	}

}
