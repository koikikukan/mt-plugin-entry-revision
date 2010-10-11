package EntryRevision::Tags;
use strict;

sub _hdlr_entry_rivision {
    my ($ctx, $args) = @_;
    my $entry = $ctx->stash('entry')
        or return _error($ctx, 'MT'.$ctx->stash('tag'));

    my $terms;
    my $rev = MT::Entry::Revision->load( $terms, $args );
    my $array = $entry->object_from_revision($rev);
    my $entry = @$array[0];
    return $entry->current_revision;
}

sub _error {
    my ($ctx, $tag) = @_;
    $ctx->error(MT->translate
    ('You used an [_1] tag outside of the proper context.', $tag));
}

1;
