package gardenpeople.validator;

import gardenpeople.model.Review;

/**
 * Created by mark-i5 on 07/12/2014.
 */
public class ReviewValidator extends Validator{


    private static  final  int MIN_COMMENT_SIZE = 1;

    private static String model = "Review";
    public ReviewValidator(){
        super(model);
    }

    public void checkReview(Review review){
        checkUsernames(review.getAuthorUsername(), review.getGardenerUsername());
        checkRating(review.getRating());
        checkComment(review.getText());
    }

    public void checkUsernames(String author, String gardener){
        if (author.equals(gardener)){
            errors.add("you cannot leave a review for yourself!");
        }

    }
    public void checkRating(int rating){
        if(rating <1){
            errors.add("you must set a rating for your review");
        }
    }
    public void checkComment(String comment){
        if(comment == null || comment.length() < MIN_COMMENT_SIZE){
            errors.add("you must leave a comment");
        }

    }


}
