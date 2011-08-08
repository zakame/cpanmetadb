package Model::CPANMetaDB;

use ORLite {
    file    => 'cpanmeta.db',
    cleanup => 'VACUUM',
    create  => sub {
        my $dbh = shift;
        $dbh->do(
            'CREATE TABLE package (name     TEXT NOT NULL UNIQUE PRIMARY KEY,
                                   distfile TEXT NOT NULL,
                                   version  TEXT
                                  );'
        );
    },
};

sub get_info_for {
    return __PACKAGE__->selectrow_hashref(
        "SELECT distfile, version
           FROM package
           WHERE name = ?", {}, $_[0],
    );
}

"Will redo this in Redis soon";
