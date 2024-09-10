using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace CustomerOnboardingApplication.Models;

public partial class CustomerOnboardingApplicationContext : DbContext
{
    public CustomerOnboardingApplicationContext()
    {
    }

    public CustomerOnboardingApplicationContext(DbContextOptions<CustomerOnboardingApplicationContext> options)
        : base(options)
    {
    }

    public virtual DbSet<Application> Applications { get; set; }

    public virtual DbSet<Company> Companies { get; set; }

    public virtual DbSet<Country> Countries { get; set; }

    public virtual DbSet<Customer> Customers { get; set; }

    public virtual DbSet<Director> Directors { get; set; }

    public virtual DbSet<Document> Documents { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see https://go.microsoft.com/fwlink/?LinkId=723263.
        => optionsBuilder.UseSqlServer("Server=K130468\\SQLEXPRESS;Database=CustomerOnboardingApplication;Integrated Security=True;Trust Server Certificate=True;");

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Application>(entity =>
        {
            entity.HasKey(e => e.ApplicationId).HasName("PK__Applicat__C93A4C99BF7B4C51");

            entity.ToTable("Application");

            entity.Property(e => e.ApplicationDate).HasColumnType("datetime");
            entity.Property(e => e.StatusOfApplication)
                .HasMaxLength(250)
                .IsUnicode(false);

            entity.HasOne(d => d.Customer).WithMany(p => p.Applications)
                .HasForeignKey(d => d.CustomerId)
                .OnDelete(DeleteBehavior.Cascade)
                .HasConstraintName("FK__Applicati__Custo__76969D2E");
        });

        modelBuilder.Entity<Company>(entity =>
        {
            entity.HasKey(e => e.CompanyId).HasName("PK__Company__2D971CACA39A4D4D");

            entity.ToTable("Company");

            entity.Property(e => e.BusinessActivity)
                .HasMaxLength(250)
                .IsUnicode(false);
            entity.Property(e => e.CountryName)
                .HasMaxLength(250)
                .IsUnicode(false);
            entity.Property(e => e.DateOfIncorporation).HasColumnType("datetime");
            entity.Property(e => e.License)
                .HasMaxLength(250)
                .IsUnicode(false);
            entity.Property(e => e.NameOfCompany)
                .HasMaxLength(250)
                .IsUnicode(false);
            entity.Property(e => e.RegistrationNumber)
                .HasMaxLength(250)
                .IsUnicode(false);
            entity.Property(e => e.TypeOfEntity)
                .HasMaxLength(250)
                .IsUnicode(false);

            entity.HasOne(d => d.Customer).WithMany(p => p.Companies)
                .HasForeignKey(d => d.CustomerId)
                .OnDelete(DeleteBehavior.Cascade)
                .HasConstraintName("FK__Company__Custome__7E37BEF6");
        });

        modelBuilder.Entity<Country>(entity =>
        {
            entity.HasKey(e => e.CountryId).HasName("PK__Country__10D1609F04ECA109");

            entity.ToTable("Country");

            entity.Property(e => e.CountryOfIncorporation)
                .HasMaxLength(250)
                .IsUnicode(false);
        });

        modelBuilder.Entity<Customer>(entity =>
        {
            entity.HasKey(e => e.CustomerId).HasName("PK__Customer__A4AE64D8960F4016");

            entity.ToTable("Customer");

            entity.Property(e => e.Email)
                .HasMaxLength(250)
                .IsUnicode(false);
            entity.Property(e => e.MainPurposeForApplyingAtMcb)
                .HasMaxLength(250)
                .IsUnicode(false)
                .HasColumnName("MainPurposeForApplyingAtMCB");
            entity.Property(e => e.NameOfApplicant)
                .HasMaxLength(250)
                .IsUnicode(false);
        });

        modelBuilder.Entity<Director>(entity =>
        {
            entity.HasKey(e => e.DirectorId).HasName("PK__Director__26C69E460C07BE8C");

            entity.ToTable("Director");

            entity.Property(e => e.NameOfDirectorOrShareholders)
                .HasMaxLength(250)
                .IsUnicode(false);
            entity.Property(e => e.PassportNumberOfDirectors)
                .HasMaxLength(250)
                .IsUnicode(false);

            entity.HasOne(d => d.Customer).WithMany(p => p.Directors)
                .HasForeignKey(d => d.CustomerId)
                .OnDelete(DeleteBehavior.Cascade)
                .HasConstraintName("FK__Director__Custom__72C60C4A");
        });

        modelBuilder.Entity<Document>(entity =>
        {
            entity.HasKey(e => e.DocumentId).HasName("PK__Document__1ABEEF0F5AADD90B");

            entity.Property(e => e.FileName)
                .HasMaxLength(250)
                .IsUnicode(false);

            entity.HasOne(d => d.Customer).WithMany(p => p.Documents)
                .HasForeignKey(d => d.CustomerId)
                .OnDelete(DeleteBehavior.Cascade)
                .HasConstraintName("FK__Documents__Custo__797309D9");
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
