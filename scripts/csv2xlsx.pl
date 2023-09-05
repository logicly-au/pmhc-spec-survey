#!/usr/bin/env perl

use strict;
use Getopt::Long;
use Excel::Writer::XLSX;
use Text::CSV_XS;
use Tie::IxHash;

use constant usage => <<'EOT'
csv2xlsx.pl [options] [example_directory]

Automatically generate Excel XLSX file from CSV files stored in <csv_directory>.

  --help                  Show this text

EOT
    ;
our ($example_dir, $help, $delete, $context);

my $version = "1-0";

GetOptions(
  'help|?|h'  => \$help,
  'delete'    => \$delete,
) or do { print usage; exit 1; };

if ($help) { print usage; exit 0; }

# Now, we can also specify the spec and version on the command line.
$example_dir ||= shift;

# Check usage...
unless (defined($example_dir)) {
    print usage;
    exit 1;
}

my %csvfiles;
my $t = tie( %csvfiles, 'Tie::IxHash' );
my ( $workbook, $context, $dir );

if ($delete) {
  $context = '-delete';
} else {
  $context = '';
}
  $dir = "yes-phn$context";
  %csvfiles = (
      'Metadata'      => "$example_dir/$dir/metadata.csv",
      'Organisations' => "$example_dir/$dir/organisations.csv",
      'Surveys'       => "$example_dir/$dir/surveys.csv",
      'YES PHN'       => "$example_dir/$dir/yes-phn.csv",
  );

  # Create a new Excel workbook
  $workbook  = Excel::Writer::XLSX->new( "$example_dir/YES-PHN-$version$context.xlsx" );

# Create a new CSV parsing object
my $csv = Text::CSV_XS->new;

foreach my $file ( keys( %csvfiles ) ) {
  # Add a worksheet
  my $worksheet = $workbook->add_worksheet( $file );

  # Open the Comma Separated Variable file
  print STDERR "CSV file: " . $csvfiles{$file} . "\n";
  open( CSVFILE, $csvfiles{$file} ) or die "$ARGV[0]: $!";

  # Row and column are zero indexed
  my $row = 0;

  while (<CSVFILE>) {
    if ( $csv->parse($_) ) {
      my @Fld = $csv->fields;

      my $col = 0;
      foreach my $token (@Fld) {
          $worksheet->write( $row, $col, $token );
          $col++;
      }
      $row++;
    } else {
      my $err = $csv->error_input;
      print "Text::CSV_XS parse() failed on argument: ", $err, "\n";
    }
  }
}

exit( 0 );
