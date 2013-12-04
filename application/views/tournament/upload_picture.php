<?php $this->load->view('header', array('title' => 'Upload picture', 'caption' => 'Add photo to tournament')); ?>
	<?php echo $error;?>
	<?php echo form_open_multipart('tournaments/admin_upload_photo/'.$tournament_id);?>
	<input type="file" name="userfile" size="20" />
	<input type="submit" value="Upload New Picture" />
</form>